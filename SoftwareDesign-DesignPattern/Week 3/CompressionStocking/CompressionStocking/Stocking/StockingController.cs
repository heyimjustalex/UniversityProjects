using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CompressionStocking.Stocking
{
    public class StockingController : IButtonHandler
    {
        private readonly ICompressionController _compressionController;


        public StockingController(ICompressionController compressionController)
        {
            _compressionController = compressionController;
        }


        // From IButtonHandler
        public void StartButtonPushed()
        {
            _compressionController.Compress();
        }

        public void StopButtonPushed()
        {
            _compressionController.Decompress();
        }
    }
}
