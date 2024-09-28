# Используем официальный образ Node.js в качестве базового
FROM node:18-alpine

# Устанавливаем pnpm
RUN npm install -g pnpm

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файлы package.json и pnpm-lock.yaml для установки зависимостей
COPY package.json pnpm-lock.yaml ./

# Устанавливаем зависимости
RUN pnpm install

# Копируем остальные файлы проекта
COPY . .

# Собираем проект
RUN pnpm build

# Указываем порт, который будет использоваться приложением
EXPOSE 3000

# Команда для запуска приложения
CMD ["pnpm", "dev"]
