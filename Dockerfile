# Используем официальный образ Python
FROM python:3.11-slim

# Устанавливаем зависимости для PostgreSQL (если нужно)
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Рабочая директория
WORKDIR /app

# Копируем зависимости
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь проект
COPY . .

# Команда для запуска (позже добавим gunicorn для продакшена)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]