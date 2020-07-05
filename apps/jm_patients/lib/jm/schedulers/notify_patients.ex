defmodule JM.Patients.Schedulers.NotifyPatients do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(state) do
    schedule()

    {:ok, state}
  end

  @impl true
  def handle_info(:schedule, state) do
    spawn_workers()

    schedule()

    {:noreply, state}
  end

  defp schedule do
    Process.send_after(self(), :schedule, 3600)
  end

  defp spawn_workers do
    spawn_notify_worker = fn x ->
      Task.start(fn -> JM.Patients.Workers.NotifyPatient.perform(x) end)
    end

    [] # Fetch all patients from repo that are eligible for receiving welcome notifications
    |> Enum.each(spawn_notify_worker)
  end
end
