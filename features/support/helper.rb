module Helper

    def screenshot(file, result)
        file_path = "report/screenshots/#{result}"
        image = "#{file_path}/#{file}.png"
        page.save_screenshot(image)
        attach(image, 'image/png')
    end

end