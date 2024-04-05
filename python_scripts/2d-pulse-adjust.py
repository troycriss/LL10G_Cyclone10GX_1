import subprocess

# Command to open the CLI
cli_command = 'C:\\intelFPGA_pro\\18.1\\quartus\\sopc_builder\\bin\\system-console.exe --cli'

# Commands to run in the CLI
cli_commands = [
    'cd {C:\\\\git\\\\LL10G\\\\hwtesting\\\\system_console}',
    'source main.tcl',
    'SEND 0 10G 1000000000000000',
    'PULSES_pos1dur 10'
]
with subprocess.Popen(cli_command, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True, text=True) as cli_process:
        
    # Concatenate all commands into a single string
    all_commands = '\n'.join(cli_commands) + '\n'

    # Run all commands in the CLI
    cli_process.stdin.write(all_commands)