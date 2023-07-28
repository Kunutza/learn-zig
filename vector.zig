/// Deprecated. Use `@Vector`.
pub fn Vector(comptime len: u32, comptime child: type) type {
    return @Type(.{
        .Vector = .{
            .len = len,
            .child = child,
        },
    });
}
