pub fn SliceIterator(comptime T: type) type {
    return struct {
        const Self = @This();
        ptr: [*]const T,
        len: usize,
    };
}

pub fn SliceIterator_(comptime T: type) T {
    return struct {
        const Self = @This();
        ptr: [*]const T,
        len: usize,
    };
}

pub fn SliceIterator__(comptime T: anytype) @TypeOf(T) {
    return struct {
        const Self = @This();
        ptr: [*]const T,
        len: usize,
    };
}
