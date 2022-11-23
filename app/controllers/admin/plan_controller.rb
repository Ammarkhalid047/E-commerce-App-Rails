class Admin::PlanController < ApplicationController
    def new   
    end

    def create
        createplan = CreatePlan.new
        plan = createplan.create_stripe_plan(params[:plan][:name], params[:plan][:display_price], params[:plan][:duration])
        if plan != nil
        @plan = Plan.new(
            stripe_id: plan.id, 
            name: plan.name, 
            display_price: plan.default_price.unit_amount, 
            price_id: plan.default_price.id,
            no_of_images: params[:plan][:no_of_images],
            no_of_products: params[:plan][:no_of_products]
        )
        @plan.save
        flash.notice = "Plan created Successfully!"
        else
        flash.alert = "There's been some issue please try again later!"
        end
        redirect_to new_admin_plan_path
    end
end
