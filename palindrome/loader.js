function loadModule(filename, imports) {
  return fetch(filename)
    .then(response => response.arrayBuffer())
    .then(buffer => WebAssembly.compile(buffer))
    .then(module => {
      imports = imports || {};
      imports.env = imports.env || {};
      imports.env.memoryBase = imports.env.memoryBase || 0; //0 | 1024
      imports.env.tableBase = imports.env.tableBase || 0;
      imports.env._strlen = function(a, b, c) {
        console.log(a, b, c);
        // debugger
        // return 0;
      };
      imports.env._printf = function(a, b, c) {
        console.log(a, b, c);
        // debugger;
      };

      if (!imports.env.memory) {
        imports.env.memory = new WebAssembly.Memory({
          initial: 256
        });
      }

      if (!imports.env.table) {
        imports.env.table = new WebAssembly.Table({
          initial: 0,
          element: 'anyfunc'
        });
      }

      return new WebAssembly.Instance(module, imports);
    });
}