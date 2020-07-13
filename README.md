# Tagion network interface
This project (tagion_network) will contain all the modules for the Tagion Network which are going to be release in the coming months from Juli 2020 and onwards.

The project now contains:

**tagion_basic** contains common functions used in the Tagion network.

**tagion_utils** contains generic function used in the Tagion network.

**tagion_hibon** contains the Hash invariant Binary Object Notation Tagion network.


This project contains a number of submodules. The submodules are updated via the following command:

```bash
make subdate
```

*IMPORTANT* When the project is cloned the first time run the `subdate` command.



To run all the unit tests:

```bash
make test
```

The source code is distributed under the  [LICENSE.md](LICENSE.md)
