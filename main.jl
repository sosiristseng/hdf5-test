# Setup
using Pkg
Pkg.add([
    PackageSpec(url="https://github.com/mkitti/HDF5_jll.jl"),
    PackageSpec(name="HDF5")
])
using HDF5_jll
using HDF5
fn = "mkitti_discourse_test.h5"

# Write test
X = h5open(fn, "w") do h5f
    h5f["data"] = rand(256)
end;

# Read back test
h5open(fn, "r") do h5f
    h5f["data"][]
end == X ? println("Test Successful") : println("Test Failed");

rm(fn)
