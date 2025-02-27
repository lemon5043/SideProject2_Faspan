import React, { useEffect, useState } from "react";
import { Label, Input, Button, Box } from "../components/Style/form-styling";
import Logo from "../assets/images/logo.svg";
import { Link, useNavigate } from "react-router-dom";
import OrderService from "../services/order.service.js";
import { HubConnectionBuilder, LogLevel } from "@microsoft/signalr"; //signalr使用
import Swal from "sweetalert2";

const Checkout = ({ currentAddress, cartDetail, setCartDetail }) => {
  const [orderInfo, setOrderInfo] = useState(null);
  const navigate = useNavigate();

  const getOrderInfo = async () => {
    const res = await OrderService.getOrderInfo(
      cartDetail.cartDetails[0].cartId,
      currentAddress.id
    );
    setOrderInfo(res.data);
    return res;
  };

  const establishOrder = async () => {
    await OrderService.postOrderEstablished(
      cartDetail.cartDetails[0].cartId,
      currentAddress.id
    )
      .then((res) => {
        console.log(res.data);
        NotifyTheStore(1, res.data);
        Swal.fire({
          title: "訂單已送出!",
          icon: "success",
          timer: 2000,
          showConfirmButton: false,
        }).then(() => {
          setCartDetail(null);
          localStorage.removeItem("cartInfo");
          //todo 傳入OrderId
          navigate("/order");
        });
      })
      .catch((error) => console.log(error));
  };

  useEffect(() => {
    getOrderInfo();
  }, []);

  //(Member)結帳後通知商家用(暫改為直接傳給外送員)
  async function NotifyTheStore(storeId, orderId) {
    try {
      //const targetRole = "store";
      const targetRole = "driver";
      const driverId = 1;
      const storeIdToInt = parseInt(storeId);
      const connection = new HubConnectionBuilder()
        .withUrl("https://localhost:7093/OrderHub")
        .configureLogging(LogLevel.Information)
        .build();
      await connection.start();
      await connection.invoke("JoinGroup", { Id: driverId, Role: targetRole }); //連上StoreGroup
      //await connection.invoke("NewOrder", storeId, orderId); //傳送訂單 正確的
      await connection.invoke("AssignOrder", driverId, orderId); //傳送訂單 臨時用
      await connection.invoke("LeaveGroup", { Id: driverId, Role: targetRole }); //離開StoreGroup
    } catch (e) {
      console.log(e);
    }
  }

  return (
    <div>
      <nav
        style={{ height: "6vh" }}
        className="bg-theme-color sticky top-0 z-10"
      >
        <ul className="flex h-full justify-between items-center w-full mr-4">
          {/* logo 標題 搜尋欄 */}
          <li className="flex items-center">
            <Link to="/" className="text-2xl flex items-center px-4">
              {/* logo */}
              <div>
                <img src={Logo} alt="logo.svg" className="w-10 -rotate-12" />
              </div>
              {/* 標題 */}
              <div className="text-2xl pl-4 font-extrabold font-nunito">
                FASPAN
              </div>
            </Link>
          </li>
        </ul>
      </nav>
      {orderInfo && (
        <div className="h-screen flex justify-center items-center">
          <Box>
            <h2 className="text-3xl font-semibold mb-6">
              {cartDetail.storeName}
            </h2>
            <h3 className="text-xl font-semibold mb-2">外送詳細資訊</h3>
            <p className="mb-2">
              <span className="font-semibold ">外送地址:</span>
              {currentAddress.address}
            </p>
            <h4 className="text-lg font-semibold mb-2">訂單摘要</h4>
            <div>
              {cartDetail.cartDetails.map((detail) => {
                return (
                  <div key={detail.identifyNum} className="border-b-2 py-2">
                    <p className="text-lg pb-2">{detail.productName}</p>
                    <p className="pb-2">{detail.itemName}</p>
                    <div className="flex justify-between">
                      <p>{detail.qty} 項</p>
                      <p>$ {detail.subTotal}</p>
                    </div>
                  </div>
                );
              })}
            </div>
            <div className="flex justify-between mb-2">
              <p>小計</p>
              <p>$ {cartDetail.total}</p>
            </div>
            <div className="flex justify-between">
              <p>外送費</p>
              <p>$ {orderInfo.deliveryFee}</p>
            </div>
            <Button onClick={establishOrder} className="mt-4">
              一鍵下訂單
            </Button>
          </Box>
        </div>
      )}
    </div>
  );
};

export default Checkout;
