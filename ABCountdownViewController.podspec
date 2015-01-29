Pod::Spec.new do |s|

    s.name              = 'ABCountdownViewController'
    s.version           = '0.0.2'
    s.summary           = 'Description of your project'
    s.homepage          = 'http://www.app-buddy.de/'
    s.license           = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author            = {
        'Malte Fentross' => 'm.fentross@app-buddy.de'
    }
    s.source            = {
        :git => 'https://stash.app-buddy.de/scm/pods/abcountdownviewcontroller.git',
        :tag => s.version.to_s
    }
    s.source_files      = 'ABCountdownViewController/*.{m,h}', 'ABCountdownViewControllerTests/*.{m,h}', 'ABCountdownViewController.xcodeproj'
    s.requires_arc      = true

end
