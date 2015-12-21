class Api::BenchesController < ApplicationController

  # def new
  #   @bench = Bench.new(bench_params)
  # end

  def create
    @bench = Bench.create!(bench_params)
  end

  def index
    @benches = Bench.in_bounds(params[:filterParams])
  end

  private
    def bench_params
      params.require(:bench).permit(:description, :lat, :lng, :seating)
    end
end
