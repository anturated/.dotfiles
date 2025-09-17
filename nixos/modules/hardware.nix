{ ... }:

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

    # dongle driver
    xone.enable = true;

    # sleep fix
    nvidia.powerManagement.enable = true;
    nvidia.modesetting.enable = true;
    nvidia.open = false;


  };
}
