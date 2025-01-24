TESTS_INIT=tests/minimal_init.lua
TESTS_DIR=tests

.PHONY: lint test

format:
	stylua --color always lua
lint:
	stylua --color always --check lua
test:
	@nvim \
		--headless \
		-u ${TESTS_INIT} \
		-c "PlenaryBustedDirectory ${TESTS_DIR} { minimal_init = '${TESTS_INIT}' }"
