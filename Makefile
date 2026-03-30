build:
	mkdir -p dist
	mdbuild ./AGENT.md > dist/craneium.agent.md

install: build
	mkdir -p ~/.config/opencode/agents
	ln -sf $(PWD)/dist/craneium.agent.md ~/.config/opencode/agents/craneium.md
	@echo "✅ Craneium linked → ~/.config/opencode/agents/craneium.md"

install-copilot: build
	mkdir -p ~/.copilot/agents
	ln -sf $(PWD)/dist/craneium.agent.md ~/.copilot/agents/craneium.md
	@echo "✅ Craneium linked → ~/.copilot/agents/craneium.md"

clean:
	rm -rf dist
