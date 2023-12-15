class NationFacade
  def get_nation_members(nation)
    service = NationService.new
    data = service.get_nation_members(nation)
    @results = data.map do |member_data|
      Member.new(member_data)
    end
  end
end