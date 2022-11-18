class Admin::PlanController < ApplicationController
    def new   
    end

    def create
        createplan = CreatePlan.new
        plan = createplan.plan_create(params[:plan][:name], params[:plan][:display_price], params[:plan][:duration])
        if plan != nil
        @plan = Plan.new(stripe_id: plan.id, name: plan.name, display_price: plan.default_price.unit_amount, price_id: plan.default_price.id)
        @plan.save
        flash.notice = "Plan created Successfully!"
        else
        flash.alert = "There's been some issue please try again later!"
        end
        redirect_to new_admin_plan_path
    end
end
