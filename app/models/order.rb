class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment_method: {credit_card: 0, transfer: 1}

  enum status: {wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4}
  #enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済:4}
  def self.payment_methods_i18n
    {
      credit_card: I18n.t("enums.order.payment_method.credit_card"),
      transfer: I18n.t("enums.order.payment_method.transfer")
    }
  end

  def self.statuses_i18n
    {
      wait_payment: I18n.t("enums.order.status.wait_payment"),
      confirm_payment: I18n.t("enums.order.status.confirm_payment"),
      making: I18n.t("enums.order.status.making"),
      preparing_ship: I18n.t("enums.order.status.preparing_ship"),
      finish_prepare: I18n.t("enums.order.status.finish_prepare")
    }
  end
end
