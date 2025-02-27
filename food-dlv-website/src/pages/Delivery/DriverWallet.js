import { useState, useEffect } from "react";
import driverAuthService from "../../services/Delivery/driverAuth.service";
import paysService from "../../services/Delivery/pays.service";

const DriverWallet = () => {
  let [errorMessage, setErrorMessage] = useState("");
  let [payDetail, setPayDetail] = useState([]);
  const token = localStorage.getItem("driver");
  useEffect(() => {
    GetAllPayRecrodes();
  }, []);

  const GetAllPayRecrodes = async (e) => {
    try {
      let driver = await driverAuthService.GetDriver(token);
      const payDetail = await (
        await paysService.GetAllPayRecrodes(driver.data.driverId, token)
      ).data;
      setPayDetail(payDetail);
      console.log(payDetail);
    } catch (e) {
      setErrorMessage(e.response.data.wrongAccountOrPassword[0]);
    }
  };

  // async function GetPayRecrodesByMonth(year,month){
  //   try {
  //     let driver = (await driverAuthService.GetDriver(token))
  //     const payDetail = await (await paysService.GetPayRecrodesByMonth(year, month, driver.data.driverId, token)).data
  //     console.log(payDetail)
  //     setPayDetail(payDetail);
  //   }
  //   catch(e) {
  //     setErrorMessage(e.response.data.wrongAccountOrPassword[0]);
  //   }
  // }
  return (
    <div className="flex justify-center h-full text-white">
      <div className="h-screen w-full max-w-md overflow-scroll">
        {payDetail.map((detail) => {
          return (
            <div key={detail.id} className="p-1">
              <p className="mb-2">結算月份:{detail.settlementMonth}</p>
              <p>外送次數:{detail.deliveryCount}</p>
              <p>總里程數:{detail.totalMilage}</p>
              <p>獎勵金:{detail.bouns}</p>
              <p>實付總額:{detail.totalPay}</p>
            </div>
          );
        })}
      </div>
    </div>
  );
};

export default DriverWallet;
