HTMLWidgets.widget({

  name: 'plotscaper',
  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        console.log(x)

        const spec = {}
        for (const [k, v] of Object.entries(x.types)) spec[k] = plotscape.col(v)

        const data = plotscape.Dataframe.parseColumns(x.data, spec)
        const scene = plotscape.Scene.of(el, data)

        for (const v of Object.values(x.plots)) {
          const { type, encoding } = v
          const selectfn = (object) => {
            const result = {}
            for (const [k, v] of Object.entries(encoding)) result[k] = object[v]
            return result
          }
          scene.addPlotByType(type, selectfn)
        }
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
