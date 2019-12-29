require 'apartment/elevators/subdomain'
class LastSubdomainElevator < Apartment::Elevators::Subdomain
  protected
  # Only care about the last subdomain for the database name
  def subdomain(host)
    subdomains(host).last
    ## Alternatively, use all segments of the subdomain
    # subdomains(host).join(".")
  end
end