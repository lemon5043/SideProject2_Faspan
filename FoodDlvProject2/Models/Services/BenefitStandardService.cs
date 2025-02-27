﻿//using AspNetCore;
using FoodDlvProject2.Models.DTOs;
using FoodDlvProject2.Models.Services.Interfaces;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace FoodDlvProject2.Models.Services
{
    public class BenefitStandardService
	{
		private readonly IBenefitStandardsRepository _repository;

		public BenefitStandardService(IBenefitStandardsRepository repository)
		{
			_repository = repository;
		}

		public async Task<IEnumerable<BenefitStandardDTO>> GetBenefitStandardsAsync()
			=> await _repository.GetBenefitStandardsAsync();

		public async Task<BenefitStandardDTO> GetOneAsync(int? id)
			=> await _repository.GetOneAsync(id);

		public async Task<string> CreateAsync(BenefitStandardDTO model)
		{
			int?[] bonusThreshold = { model.BonusThreshold1, model.BonusThreshold2, model.BonusThreshold3 };

			if (!bonusThreshold.SequenceEqual(bonusThreshold.OrderBy(x => x).ToArray())) throw new ArgumentOutOfRangeException("應依小至大輸入門檻");

            if (model.Selected == true)
            {
                _repository.CancelSelection();
            }
            return await _repository.CreateAsync(model);
		}
		
		public async Task<string> EditAsync(BenefitStandardDTO model)
		{
			int?[] bonusThreshold = { model.BonusThreshold1, model.BonusThreshold2, model.BonusThreshold3 };

			if (!bonusThreshold.SequenceEqual(bonusThreshold.OrderBy(x => x).ToArray())) throw new ArgumentOutOfRangeException("應依小至大輸入門檻");

			if (model.Selected == false && model.Id == _repository.FindSelectBenefitStandard())
			{
				throw new Exception("正在使用的方案不可取消");
			}
			if (model.Selected==true && model.Id != _repository.FindSelectBenefitStandard())
			{
				_repository.CancelSelection();
			}
			return await _repository.EditAsync(model);
		}

        public async Task<string> DeleteAsync(int? id)
		{
			return await _repository.DeleteAsync(id);
		}

    }
}
