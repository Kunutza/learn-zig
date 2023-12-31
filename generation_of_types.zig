const builtin = @import("std").builtin;
const A = @Type(.{
    .Struct = .{
        .layout = .Auto,
        .fields = &[_]builtin.TypeInfo.StructField{
            .{ .name = "one", .field_type = i32, .default_value = null, .is_comptime = false, .alignment = 0 },
        },
        .decls = &[_]builtin.TypeInfo.Declaration{},
        .is_tuple = false,
    },
});
test "generate type" {
    const a: A = .{ .one = 25 };
    _ = a;
}
