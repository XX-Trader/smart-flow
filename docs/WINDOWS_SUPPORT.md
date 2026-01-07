# Windows Support for Smart Flow

Smart Flow includes full support for Windows through polyglot hooks that work across platforms.

## Polyglot Hook Wrapper

The `run-hook.cmd` script is a polyglot wrapper that runs shell scripts on Windows:

```batch
@echo off
REM Polyglot wrapper: runs .sh scripts cross-platform
"C:\Program Files\Git\bin\bash.exe" -l "%~dp0%~1" %2 %3 %4 %5 %6 %7 %8 %9
```

This allows the same `.sh` scripts to work on both Unix and Windows systems.

## Installation on Windows

### Using Git Bash

**1. Install Git for Windows**
   - Download: https://git-scm.com/download/win
   - Install with default options

**2. Clone Smart Flow**

```bash
# Using Git Bash
cd ~/.claude/plugins
git clone https://github.com/YOUR-USERNAME/smart-flow.git
```

**3. Configure Claude Code**

Edit `C:\Users\YourName\.claude\CLAUDE.md` and add the Smart Flow configuration (see `.claude/INSTALL.md`)

**4. Verify Installation**

In Claude Code:
```
/smart-flow
```

### Using Windows Command Prompt

**1. Clone Smart Flow**

```cmd
cd C:\Users\YourName\.claude\plugins
git clone https://github.com/YOUR-USERNAME/smart-flow.git
```

**2. Run Installation Hook**

```cmd
cd C:\Users\YourName\.claude\plugins\smart-flow\hooks
run-hook.cmd install.sh
```

**3. Configure CLAUDE.md**

Edit `C:\Users\YourName\.claude\CLAUDE.md` with your text editor

## Running Hooks on Windows

### Bootstrap

```cmd
C:\Users\YourName\.claude\skills\smart-flow\hooks\run-hook.cmd bootstrap.sh
```

### Installation

```cmd
C:\Users\YourName\.claude\skills\smart-flow\hooks\run-hook.cmd install.sh
```

### Other Hooks

Any `.sh` script in the `hooks/` directory can be run using:

```cmd
run-hook.cmd script-name.sh [args...]
```

## Path Examples

On Windows, paths will be:

- **Smart Flow Root**: `C:\Users\YourName\.claude\skills\smart-flow\`
- **Skills**: `C:\Users\YourName\.claude\skills\smart-flow\skills\`
- **Hooks**: `C:\Users\YourName\.claude\skills\smart-flow\hooks\`
- **Docs**: `C:\Users\YourName\.claude\skills\smart-flow\docs\`

## Troubleshooting

### Git Bash Not Found

**Problem**: `run-hook.cmd` cannot find Git Bash

**Solution**:
1. Install Git for Windows
2. Verify Git Bash is at `C:\Program Files\Git\bin\bash.exe`
3. If installed elsewhere, update `run-hook.cmd` with correct path

### Permission Denied

**Problem**: Scripts cannot execute

**Solution**:
1. Right-click on Git Bash → "Run as Administrator"
2. Or adjust Git Bash permissions:
   ```bash
   chmod +x ~/.claude/plugins/smart-flow/hooks/*.sh
   ```

### Path Too Long

**Problem**: Windows path length limit (260 characters)

**Solution**:
1. Use shorter path: `C:\claude\skills\` instead of `C:\Users\YourName\.claude\skills\`
2. Enable long path support in Windows 10+

## Testing Installation

Test that Smart Flow works on Windows:

**1. Check Files Exist**

```cmd
dir C:\Users\YourName\.claude\skills\smart-flow\skills\
```

Should see:
- smart-workflow/
- requirements-clarity/
- task-decomposer/
- parallel-executor/
- result-synthesizer/

**2. Run Bootstrap**

```cmd
C:\Users\YourName\.claude\skills\smart-flow\hooks\run-hook.cmd bootstrap.sh
```

Should see:
```
🚀 Smart Flow Bootstrap
======================

✅ Loaded: smart-workflow
✅ Loaded: requirements-clarity
✅ Loaded: task-decomposer
✅ Loaded: parallel-executor
✅ Loaded: result-synthesizer

✨ Smart Flow is ready!
```

**3. Test in Claude Code**

```
/smart-flow
```

## Compatibility

Smart Flow on Windows supports:
- ✅ Windows 10
- ✅ Windows 11
- ✅ Git Bash
- ✅ WSL (Windows Subsystem for Linux)
- ✅ Claude Code for Windows

## Performance

Smart Flow on Windows has the same performance as on Unix systems:
- Hooks run via Git Bash
- No performance overhead
- Full feature parity

## Next Steps

After installation:
1. ✅ Test with `/smart-flow`
2. ✅ Read `README.md` for usage guide
3. ✅ Explore `docs/` for advanced features

## Support

If you encounter issues on Windows:
- GitHub: [smart-flow/issues](https://github.com/YOUR-USERNAME/smart-flow/issues)
- Include: Windows version, Git Bash version, error messages
