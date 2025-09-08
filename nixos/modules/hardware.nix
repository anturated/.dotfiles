{ pkgs, ... }:

{
  hardware = {

	  bluetooth = {
  	  enable = true;
  	  powerOnBoot = true;
  	  settings = {
    	  General = {
      	  # Shows battery charge
      	  Experimental = true;
      	  # Faster connect, more power drain
      	  FastConnectable = true;
    	  };
    	  Policy = {
      	  # Enable all controllers when they are found.
      	  AutoEnable = true;
    	  };
  	  };
    };

    xone.enable = true;

    nvidia = {
      powerManagement.enable = true;
      prime = {
        offload.enable = true;
        offload.enableOffloadCmd = true;

        amdgpuBusId = "PCI:6:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

  };
}
