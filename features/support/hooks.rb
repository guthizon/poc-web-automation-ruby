After do |scenario|
    scenario_name = scenario.name.gsub(/\s+/,'-').tr('/', '-')

    if scenario.failed?
        screenshot(scenario_name, 'fail')
    else
        screenshot(scenario_name, 'pass')

    end

end