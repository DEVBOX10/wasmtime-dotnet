using System;
using Wasmtime;

namespace HelloExample
{
    class Program
    {
        static void Main(string[] args)
        {
            using var host = new Host();

            host.DefineFunction(
                "",
                "hello",
                () => Console.WriteLine("Hello from C#, WebAssembly!")
            );

            using var module = host.LoadModuleText("hello.wat");

            using dynamic instance = host.Instantiate(module);
            instance.run();
        }
    }
}
