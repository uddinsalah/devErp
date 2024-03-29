﻿using System;
using System.Collections.Generic;
using System.Data;
using DevERP.Models;
using DevERP.Others;

namespace DevERP.DAL
{
    public class TransactionGatway : ConnectionGateway
    {
        public bool InsertTransaction(Transaction transaction)
        {
            Query = "Insert into Transactions (transactionDate,itemId,subItemId,amount,catagory,partyId,paymentType,bankId,remarks)" +
                    " values (@transactionDate,@itemId,@subItemId,@amount,@catagory,@partyId,@paymentType,@bankId,@remarks)";
            PrepareCommand(CommandType.Text);
            Command.Parameters.AddWithValue("@transactionDate", transaction.TransactionDate);
            Command.Parameters.AddWithValue("@itemId", transaction.ItemId);
            Command.Parameters.AddWithValue("@subItemId", transaction.SubItemId);
            Command.Parameters.AddWithValue("@amount", transaction.Amount);
            Command.Parameters.AddWithValue("@catagory", transaction.Catagory);
            Command.Parameters.AddWithValue("@partyId", transaction.PartyId);
            Command.Parameters.AddWithValue("@paymentType", transaction.PaymentType);
            Command.Parameters.AddWithValue("@bankId", transaction.BankId);
            Command.Parameters.AddWithValue("@remarks", transaction.Remarks);
            Connection.Open();
            try
            {
                return Command.ExecuteNonQuery()>0;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                CloseAllConnection();
            }
        }
        public bool UpdateTransaction(Transaction transaction)
        {
            Query = "Update Transactions set transactionDate=@transactionDate,itemId=@itemId,subItemId=@subItemId,amount=@amount,catagory=@catagory," +
                    "partyId=@partyId,paymentType=@paymentType,bankId=@bankId,remarks=@remarks where transactionId = @transactionId";
            PrepareCommand(CommandType.Text);
            Command.Parameters.AddWithValue("@transactionId", transaction.TransactionId);
            Command.Parameters.AddWithValue("@transactionDate", transaction.TransactionDate);
            Command.Parameters.AddWithValue("@itemId", transaction.ItemId);
            Command.Parameters.AddWithValue("@subItemId", transaction.SubItemId);
            Command.Parameters.AddWithValue("@amount", transaction.Amount);
            Command.Parameters.AddWithValue("@catagory", transaction.Catagory);
            Command.Parameters.AddWithValue("@partyId", transaction.PartyId);
            Command.Parameters.AddWithValue("@paymentType", transaction.PaymentType);
            Command.Parameters.AddWithValue("@bankId", transaction.BankId);
            Command.Parameters.AddWithValue("@remarks", transaction.Remarks);
            Connection.Open();
            try
            {
                return Command.ExecuteNonQuery() > 0;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                CloseAllConnection();
            }
        }
        public bool DeleteTransaction(int transactionId)
        {
            Query = "delete from Transactions where transactionId = @transactionId";
            PrepareCommand(CommandType.Text);
            Command.Parameters.AddWithValue("@transactionId", transactionId);
            Connection.Open();
            try
            {
                return Command.ExecuteNonQuery() > 0;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                CloseAllConnection();
            }
        }
        public List<Transaction> GetAllTransaction()
        {
            Query = "select * from GetAllTransaction";
            PrepareCommand(CommandType.Text);
            List<Transaction> transactions = new List<Transaction>();
            Connection.Open();
            try
            {
                Reader = Command.ExecuteReader();
                while (Reader.Read())
                {
                    Transaction transaction = new Transaction();
                    transaction.TransactionId = Reader["transactionId"] != DBNull.Value
                        ? Convert.ToInt32(Reader["transactionId"].ToString())
                        : 0;
                    transaction.TransactionDate = Reader["transactionDate"] != DBNull.Value
                        ? Convert.ToDateTime(Reader["transactionDate"].ToString())
                        : DateTime.MaxValue;
                    transaction.ItemId = Reader["itemId"] != DBNull.Value
                        ? Convert.ToInt32(Reader["itemId"].ToString())
                        : 0;
                    transaction.ItemName = Reader["itemName"] != DBNull.Value
                        ? Reader["itemName"].ToString()
                        : string.Empty;
                    transaction.SubItemId = Reader["subItemId"] != DBNull.Value
                        ? Convert.ToInt32(Reader["subItemId"].ToString())
                        : 0;
                    transaction.SubItemName = Reader["subItemName"] != DBNull.Value
                        ? Reader["subItemName"].ToString()
                        : string.Empty;
                    transaction.Amount = Reader["amount"] != DBNull.Value
                        ? Convert.ToDecimal(Reader["amount"].ToString())
                        : 0;
                    transaction.Catagory = Reader["catagory"] != DBNull.Value
                        ? Reader["catagory"].ToString()
                        : string.Empty;
                    transaction.PartyId = Reader["partyId"] != DBNull.Value
                        ? Convert.ToInt32(Reader["partyId"].ToString())
                        : 0;
                    transaction.PartyName = Reader["partyName"] != DBNull.Value
                        ? Reader["partyName"].ToString()
                        : string.Empty;
                    transaction.PaymentType = Reader["paymentType"] != DBNull.Value
                        ? Reader["paymentType"].ToString()
                        : string.Empty;
                    transaction.BankId = Reader["bankId"] != DBNull.Value
                        ? Convert.ToInt32(Reader["bankId"].ToString())
                        : 0;
                    transaction.BankName = Reader["bankName"] != DBNull.Value
                        ? Reader["bankName"].ToString()
                        : string.Empty;
                    transaction.Remarks = Reader["remarks"] != DBNull.Value
                        ? Reader["remarks"].ToString()
                        : string.Empty;
                    transaction.ChequeStatus = Reader["chequeStatus"] != DBNull.Value
                       ? Reader["chequeStatus"].ToString()
                       : string.Empty;
                    transaction.LastModify = Reader["lastModify"] != DBNull.Value
                        ? Convert.ToDateTime(Reader["lastModify"].ToString())
                        : DateTime.MaxValue;
                    transactions.Add(transaction);
                }
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                CloseAllConnection();
                
            }
            return transactions;
        }
        public decimal GetBalance(out bool isSuccss)
        {
            Query = "select ((select IsNull(SUM(amount),0) from (select * from GetPassTransaction) as a where a.catagory='income')-(select IsNull(SUM(amount),0) from (select * from GetPassTransaction) as a where a.catagory='expence')) as balance";
            PrepareCommand(CommandType.Text);
            isSuccss = true;
            Connection.Open();
            try
            {
                Reader = Command.ExecuteReader();
                if (Reader.Read())
                {
                    return (decimal) Reader["balance"];
                }
                isSuccss = false;
                return 0;
            }
            catch (Exception)
            {
                isSuccss = false;
                return 0;
            }
            finally
            {
                CloseAllConnection();

            }
        }
    }
}