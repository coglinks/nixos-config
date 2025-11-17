{ pkgs ? import <nixpkgs> {} }:
let
  pix2text = pkgs.python311Packages.buildPythonPackage rec {
	pname = "pix2text";
	version = "1.1.1";
	format = "wheel";
    src = pkgs.fetchurl {
	  #inherit pname version format;
	  url = "https://files.pythonhosted.org/packages/c9/64/d00fb1dfbef8bc3c29cf11c8878055a125905759cacf1a6659735bac3651/pix2text-1.1.1-py3-none-any.whl";
      #sha256 = "sha256-lgEwsxCnMQKyNdhXMnxv2ArNMrEcH9YMVj478TAd6mY=";
      sha256 = "sha256-ZEcpf+qNgU4LCDXN9qFeMYu1JPh+Z98rMH4knlTgPh0=";
    };

	# Now need to download the weights
    #weights = pkgs.fetchurl {
    #  url = "https://github.com/lukas-blecher/LaTeX-OCR/releases/download/v0.0.1/weights.pth";
    #  sha256 = "sha256-pj2RQcU9Jmy2gvtai9g71cvigxReDnjr3A+JUZWh36o=";
    #};
    #resizer = pkgs.fetchurl {
    #  url = "https://github.com/lukas-blecher/LaTeX-OCR/releases/download/v0.0.1/image_resizer.pth";
    #  sha256 = "sha256-HDggZZmFrRQrUmSQuyXCPZdxdqwgc1kbO92tppJxhFg=";
    #};

	# Now need to symlink the weights so that they can be used
	postInstall = ''
	  echo "***********************************"
	  echo "***** Installed successfully! *****"
	  echo "***** Downloading the weights *****"
	  echo "***********************************"
      echo "Creating the static/ directory..."
      mkdir -p $out/lib/python3.11/site-packages/pix2text/static
	  '';
      #checkpoint_dir=$out/lib/python3.11/site-packages/pix2text/model/checkpoints
      #mkdir -p $checkpoint_dir
      #ln -s ${weights} $checkpoint_dir/weights.pth
      #ln -s ${resizer} $checkpoint_dir/image_resizer.pth    
  };

  # Prerequisite for pix2text, not packaged in nixpkgs
  cnstd = pkgs.python311Packages.buildPythonPackage rec {
    pname = "cnstd";
    version = "1.2.4.1"; # We use an older version, as required by the package
    format = "wheel";
    src = pkgs.fetchurl {
	  url = "https://files.pythonhosted.org/packages/b1/d1/11298fbd7c3d6ef67e2fcbc7a4afb2b38a532eca6fd18ee2e891f3ec4c5d/cnstd-1.2.4.1-py3-none-any.whl";
      sha256 = "sha256-8d0Wh/YJoqSj9HCcU3aBb8SxQnM/asBm/d4vR2TYBcY=";
    };
  };

  # Prerequisite for pix2text, not packaged in nixpkgs
  cnocr = pkgs.python311Packages.buildPythonPackage rec {
    pname = "cnocr";
    version = "2.3.0.2"; # We use an older version, as required by the package
    format = "wheel";
    src = pkgs.fetchurl {
	  url = "https://files.pythonhosted.org/packages/b5/3d/c978986e04468dbbb3fb490cce28a33af7b7c6b287fa6308c489d3a65b0e/cnocr-2.3.0.2-py3-none-any.whl";
      sha256 = "sha256-LMXHvZyLyCv6YpqSThF9Usn82BZsgUShEveets7gHmY=";
    };
  };

  # Prerequisite for pix2text, not packaged in nixpkgs
  ultralytics = pkgs.python311Packages.buildPythonPackage rec {
    pname = "ultralytics";
    version = "8.2.36"; # We use an older version, as required by the package
    format = "wheel";
    src = pkgs.fetchurl {
	  url = "https://files.pythonhosted.org/packages/d7/0c/8a9aa28d65d49ce4651a73ff5b05f98fb103ca22df1abc72e37d9f16f395/ultralytics-8.2.36-py3-none-any.whl";
      sha256 = "sha256-oJ1blpBfdnU/i/Tq0dZ/mt4FOpuEiKkkeqorsf0Fftg=";
    };
  };

  # Prerequisite for pix2text, not packaged in nixpkgs
  fitz = pkgs.python311Packages.buildPythonPackage rec {
    pname = "fitz";
    version = "0.0.1.dev2"; # We use an older version, as required by the package
    format = "wheel";
    src = pkgs.fetchurl {
	  url = "https://files.pythonhosted.org/packages/7e/28/27f27d66eb82f24e6595deb26c0a875e62431878c416e38eac515023abb2/fitz-0.0.1.dev2-py2.py3-none-any.whl";
      sha256 = "sha256-O3UIPVgGjZvVFpXrL3jJySCUzWyNrag56T7c3fGMDFw=";
    };
	buildInputs = [
      pkgs.python311Packages.ipython
	  pkgs.python311Packages.numpy
	  pkgs.python311Packages.scipy
	  pkgs.python311Packages.matplotlib
	  pkgs.python311Packages.pandas
	  pkgs.python311Packages.nibabel
	  pkgs.python311Packages.nipype
	  pkgs.python311Packages.pyxnat
	  pkgs.python311Packages.httplib2
	];
  };
  fitz_src = pkgs.python311Packages.buildPythonPackage rec {
    pname = "fitz";
    version = "0.0.1.dev2"; # We use an older version, as required by the package
	format = "pyproject";
    src = pkgs.fetchFromGitHub {
      owner = "kastman";
      repo = "fitz";
      rev = "70896def859886bbaa42c67bba3634b92282d2fd";
      hash = "sha256-/5G26FdrSaz9Y3oqcsCGCYDq9wzGxS47mp7XH7CsCUA=";
    };
	buildInputs = [
      pkgs.python311Packages.setuptools
      pkgs.python311Packages.ipython
	  pkgs.python311Packages.numpy
	  pkgs.python311Packages.scipy
	  pkgs.python311Packages.matplotlib
	  pkgs.python311Packages.pandas
	  pkgs.python311Packages.nibabel
	  pkgs.python311Packages.nipype
	  pkgs.python311Packages.pyxnat
	  pkgs.python311Packages.httplib2
	];
  };

  # Prerequisite for pix2text, not packaged in nixpkgs
  frontend = pkgs.python311Packages.buildPythonPackage rec {
    pname = "frontend";
    version = "0.0.3"; # We use an older version, as required by the package
    format = "wheel";
    src = pkgs.fetchurl {
	  url = "https://files.pythonhosted.org/packages/98/02/a9c4713b26ae11464ac334b59504ef6fe66e2c323ee44520ca1cd6dc4929/frontend-0.0.3-py3-none-any.whl";
      sha256 = "sha256-mzbXCSiSJxQxzWk+rKFHZ6y9u2f29vONw+D/FWGMcQk=";
    };
  };

in
  pkgs.mkShell {
    buildInputs = [
	 # For building: pix2text
     pkgs.python311
     pkgs.python311Packages.torch
	 # For running pix2text
     pkgs.python311Packages.pandas
     pkgs.python311Packages.matplotlib
     pkgs.python311Packages.transformers
     pkgs.python311Packages.timm
     pkgs.python311Packages.tqdm
     pkgs.python311Packages.tokenizers
     pkgs.python311Packages.numpy
     pkgs.python311Packages.pillow
     pkgs.python311Packages.shapely
     pkgs.python311Packages.torch
     pkgs.python311Packages.torchvision
     pkgs.python311Packages.pyclipper
     pkgs.python311Packages.unidecode
     pkgs.python311Packages.opencv4
     pkgs.python311Packages.seaborn
     pkgs.python311Packages.optimum
     pkgs.python311Packages.onnxruntime
     pkgs.python311Packages.onnx
     pkgs.python311Packages.psutil
     pkgs.python311Packages.pyspellchecker
     pkgs.python311Packages.pymupdf
     pkgs.python311Packages.fastapi
     pkgs.python311Packages.python-multipart
     pkgs.python311Packages.pydantic
     pkgs.python311Packages.py-cpuinfo

     frontend
     pkgs.python311Packages.starlette
     pkgs.python311Packages.uvicorn
     pkgs.python311Packages.itsdangerous

     ultralytics

     cnocr
	 cnstd

	 pix2text
    ];
	shellHook = ''
	'';
  }
