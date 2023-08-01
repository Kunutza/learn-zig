const std = @import("std");

const parseInt = std.fmt.parseInt;

const Arg = struct { arg: ?[]const u8 };

pub fn main() void {
    var args = std.process.args();

    var displayHelp = false;
    var emailAddress: ?[]const u8 = null;

    var arg_index: usize = 0;
    var args_array: [100]Arg = undefined;
    var arg = args.inner.next();
    while (arg != null) : (arg_index += 1) {
        args_array[arg_index] = .{ .arg = arg };
        arg = args.inner.next();
    }

    var array_index: usize = 0;
    while (array_index < arg_index) : (array_index += 1) {
        const argString = args_array[array_index].arg;
        if (argString != null) {
            const arg_str: []const u8 = argString.?;
            std.debug.print("{s}\n", .{arg_str});

            if (std.mem.eql(u8, arg_str, "-h") or std.mem.eql(u8, arg_str, "--help")) {
                displayHelp = true;
            } else if (std.mem.eql(u8, arg_str, "-e") or std.mem.eql(u8, arg_str, "--email")) {
                if (array_index + 1 < arg_index and args_array[array_index + 1].arg.?[0] != '-') {
                    const nextargString = args_array[array_index + 1].arg;
                    const next_arg_str: []const u8 = nextargString.?;
                    emailAddress = next_arg_str;
                    array_index += 1;
                } else {
                    std.debug.print("Error: {s} option requires an email address.\n", .{arg_str});
                    return;
                }
            }
        } else {
            std.debug.print("null\n", .{});
        }
    }

    if (displayHelp) {
        printHelp();
    }

    if (emailAddress != null) {
        std.debug.print("Email Address: {s}\n", .{emailAddress.?});
    } else {
        std.debug.print("email was null\n", .{});
    }
}

fn printHelp() void {
    var helpMessage = .{
        "Usage: your_program [OPTIONS]\n",
        "Options:\n",
        "  -h, --help       Display this help message\n",
        "  -e EMAIL         Specify an email address\n",
    };

    inline for (helpMessage) |help_line| {
        std.debug.print("{s}\n", .{&help_line.*});
    }
}

// zig build-exe your_program.zig
// ./your_program -h
// ./your_program --help
// ./your_program -e example@example.com

// zig run your_program.zig -- -h
// zig run your_program.zig -- --help
// zig run your_program.zig -- -e example@example.com
