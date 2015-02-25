class RulesController < ApplicationController
  def new
    @rule_store = RuleStore.find params[:rule_store_id]
  end

  def create
    @rule_store = RuleStore.find params[:rule_store_id]
    @rule = @rule_store.rules.create rule_params
    redirect_to rule_store_path params[:rule_store_id]
  end

  def show
    @rule = Rule.find params[:id]
  end

  def edit
    @rule_store = RuleStore.find params[:rule_store_id]
    @rule = @rule_store.rules.find params[:id]
  end

  def update
    @rule_store = RuleStore.find params[:rule_store_id]
    @rule = @rule_store.rules.find params[:id]
    if @rule.update_attributes rule_params
      redirect_to rule_store_rule_path(@rule_store, @rule)
    else
      render 'edit'
    end
  end

  def destroy
    @rule = Rule.find params[:id]
    @rule.destroy
    redirect_to rule_store_path @rule.rule_store
  end

  private
  def rule_params
      params.require(:rule).permit(:name, :description)
  end
end
