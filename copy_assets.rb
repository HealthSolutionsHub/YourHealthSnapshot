require "fileutils"

# Путь к папке Assets в репозитории темы
source = File.join(Dir.pwd, "Minimal_Mistakes_Team", "Assets")

# Путь, куда копировать в сборке Jekyll
destination = File.join(Dir.pwd, "_site", "Assets")

# Создаём папку назначения, если нет
FileUtils.mkdir_p(destination)

# Копируем все файлы и подпапки
FileUtils.cp_r("#{source}/.", destination)

puts "Assets скопированы в _site/Assets!"
