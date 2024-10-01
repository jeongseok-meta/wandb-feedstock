@echo on

PUSHD nvidia_gpu_stats
cargo-bundle-licenses --format yaml --output ../THIRDPARTY.yml || goto :error
POPD

%PYTHON% -m pip install --no-deps --no-build-isolation -vv .

PUSHD core
copy ../LICENSE . 
go-licenses save . --save_path="./license-files" || goto :error
POPD

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
