class Api::BenchesController < ApplicationController

  def create
    @bench = Bench.create!(bench_params)
  end

  def index
    @benches = Bench.in_bounds(params[:bounds])
  end

  private
    def bench_params
      params.permit(:bench).require(:description, :lat, :lng)
    end
end
