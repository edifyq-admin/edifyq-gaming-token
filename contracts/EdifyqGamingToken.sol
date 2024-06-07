// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EdifyqGamingToken {
    mapping(address account => uint256) private _balances;
    mapping(address account => mapping(address spender => uint256)) private _allowances;

    uint256 private _totalSupply = 1000000;

    string private _name = "Edifyq Gaming Token";
    string private _symbol = "$EGT";

    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        _balances[msg.sender] = 1000000;
    }

    function allowance(address owner, address spender) public view returns(uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 value) public returns(bool) {
        address owner = msg.sender;
        _approve(owner, spender, value);
        return true;
    }

    function balanceOf(address account) public view returns(uint256) {
        return _balances[account];
    }

    function decimals() external pure returns (uint8) {
        return 0;
    }

    function mint(address account, uint256 value) public {
        _mint(account, value);
    }

    function name() external view returns(string memory) {
        return _name;
    }

    function symbol() external view returns(string memory) {
        return _symbol;
    }

    function totalSupply() external view returns(uint256) {
        return _totalSupply;
    }

    function transfer(address to, uint256 value) public returns(bool) {
        address owner = msg.sender;
        _transfer(owner, to, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns(bool) {
        // address spender = msg.sender;
        // _spendAllowance(from, spender, value);
        _transfer(from, to, value);
        return true;
    }

    function _approve(address owner, address spender, uint256 value) internal {
        require(owner != address(0), "Invalid approver");
        require(spender != address(0), "Invalid spender");

        _allowances[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    function _burn(address account, uint256 value) internal {
        require(account != address(0), "Invalid sender");
        _update(account, address(0), value);
    }

    function _mint(address account, uint256 value) internal {
        require(account != address(0), "Invalid receiver");
        _update(address(0), account, value);
    }

    function _transfer(address from, address to, uint256 value) private {
        require(from != address(0), "Invalid Sender");
        require(to != address(0), "Invalid receiver");
        _update(from, to, value);
    }

    function _update(address from, address to, uint256 value) internal {
        if (from == address(0)) {
            _totalSupply += value;
        } else {
            uint256 fromBalance = _balances[from];
            require(value <= fromBalance, "Insufficient balance");
            unchecked {
                _balances[from] = fromBalance - value;
            }
        }

        if (to == address(0)) {
            unchecked {
                _totalSupply -= value;
            }
        } else {
            unchecked {
                _balances[to] += value;
            }
        }

        emit Transfer(from, to, value);
    }

}
