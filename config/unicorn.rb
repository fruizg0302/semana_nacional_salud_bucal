# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/Users/fruizg0302/Desarrollo/Ruby/metas_salud_bucal_rails4"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/Users/fruizg0302/Desarrollo/Ruby/metas_salud_bucal_rails4/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/Users/fruizg0302/Desarrollo/Ruby/metas_salud_bucal_rails4/log/unicorn.log"
stdout_path "/Users/fruizg0302/Desarrollo/Ruby/metas_salud_bucal_rails4/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.metas_salud_bucal_rails4.sock"
listen "/tmp/unicorn.myapp.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
