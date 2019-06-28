# Configure the New Relic provider
provider "newrelic" {
  api_key = "${var.newrelic_api_key}"
}

resource "newrelic_dashboard" "exampledash" {
  title = "New Relic Terraform Example"

  widget {
    title         = "Average Transaction Duration"
    row           = 1
    column        = 1
    width         = 2
    visualization = "faceted_line_chart"
    nrql          = "SELECT AVERAGE(duration) from Transaction FACET appName TIMESERIES auto"
  }

  widget {
    title         = "Page Views"
    row           = 1
    column        = 3
    visualization = "billboard"
    nrql          = "SELECT count(*) FROM PageView SINCE 1 week ago"
  }
}
