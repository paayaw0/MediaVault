module DataHubsHelper
  def plan_type_color(text)
    {
      0 => 'primary',
      1 => 'secondary',
      2 => 'default',
      3 => 'warning',
      4 => 'success'
    }[DataHub::plan_types[text]]
  end
end
