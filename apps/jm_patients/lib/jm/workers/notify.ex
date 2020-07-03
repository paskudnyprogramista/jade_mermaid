defmodule JM.Patients.Workers.Notify do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(state) do
    schedule_worker()

    {:ok, state}
  end

  @impl true
  def handle_info(:work, state) do
    schedule_worker()

    {:noreply, state}
  end

  defp schedule_worker do
    Process.send_after(self(), :work, 3600)
  end
end
