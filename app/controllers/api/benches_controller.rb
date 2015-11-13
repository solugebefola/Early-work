class Api::BenchesController

  def create
    @bench = Bench.create!(bench_params)

    render :json @bench
  end

  def index
    @benches = Bench.all()

    render :json @benches
  end

  private
    def bench_params
      params.permit(:bench).require(:description, :lat, :lng)
    end
end
