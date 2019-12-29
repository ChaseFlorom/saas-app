require 'apartment/elevators/subdomain'
class LastSubdomainElevator < Apartment::Elevators::Subdomain
  def self.excluded_subdomains
        @excluded_subdomains ||= ['www']
  end

  def self.excluded_subdomains=(arg)
    @excluded_subdomains = arg
  end

  def parse_tenant_name(request)
    request_subdomain = subdomain(request.host)

    # If the domain acquired is set to be excluded, set the tenant to whatever is currently
    # next in line in the schema search path.
    tenant = if self.class.excluded_subdomains.include?(request_subdomain)
      nil
    else
      request_subdomain
    end

    tenant.presence
  end
  
  
  protected
  # Only care about the last subdomain for the database name
    def subdomain(host)
        subdomains(host).last
        ## Alternatively, use all segments of the subdomain
        # subdomains(host).join(".")

    end
end