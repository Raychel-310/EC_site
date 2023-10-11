class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum production_status: {impossible_manufacture:0, waiting_manufacture:1, manufacturing:2, finish:3}

  def self.production_statuses_i18n
    {
      impossible_manufacture: I18n.t("enums.order_detail.production_status.impossible_manufacture"),
      waiting_manufacture: I18n.t("enums.order_detail.production_status.waiting_manufacture"),
      manufacturing: I18n.t("enums.order_detail.production_status.manufacturing"),
      finish: I18n.t("enums.order_detail.production_status.finish")
    }
  end
end
