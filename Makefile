default:
	@echo "No default task"

lint:
	shellcheck -s bash find_open_port.sh
