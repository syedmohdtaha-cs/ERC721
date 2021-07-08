// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0;

import "./ERC721Full.sol";

contract Color is ERC721Full {
    
    uint _id;
    string[] public colors;
    mapping(string => bool) _colorExists;

    //constructor for minting ERC721 token ...parameters name,symbol

    constructor() ERC721Full("Color", "COLOR") public {
  }

    function mint(string memory _color) public {
        require(!_colorExists[_color]);
        _id = colors.push(_color);
        _mint(msg.sender, _id);
        _colorExists[_color] = true;
    }
    function burn(string memory _color) public {
      require(_colorExists[_color]);
      _burn(msg.sender,1);
      _colorExists[_color] = false;
    }
    
 }