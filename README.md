# FetchForeverToFile - Continuous Acquisition for Legacy National Instruments NI-SCOPE High-Speed Digitisers

NI provides a series of C++ examples with their NI-SCOPE driver package that demonstrate various measurement and acquisition techniques using the NI-SCOPE C API. Including:
- Reading and fetching data in raw binary and scaled physical values.
- Initiating and triggering an acquisition.
- Asynchronous data acquisition.

The most common use of these cards is probably as a PC based oscilloscope and the included "Scope Soft Front Panel" covers the basics of this.

The second most common use case is probably as a high speed ADC used to record a continuous signal to disk at high rates. Here, out of the box software is lacking.

This repository contains a modified version of the example file "FetchForever", which is designed to demonstrate continuous asynchronous acquisition using the read pointer. Instead of fetching scaled values in double precision and displaying it as an ascii graph, it fetches 8-bit raw samples and saves them to disk allowing acquisition speeds of 25 million samples per second on legacy PCI cards (when used via a PCI to PCIe adaptor)
