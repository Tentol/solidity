contract C {
	function f(uint x) public pure returns (uint) {
		return 2 * x;
	}
	function g() public view returns (function (uint) external returns (uint)) {
		return this.f;
	}
	function h(uint x) public returns (uint) {
		return this.g()(x) + 1;
	}
	function t() external view returns (
			function(uint) external returns (uint) a,
			function(uint) external view returns (uint) b) {
		a = this.f;
		b = this.f;
	}
}
// ====
// compileViaYul: also
// ----
// f(uint256): 2 -> 4
// h(uint256): 2 -> 5
// t() -> 7175878113405833249322534082293024008058894263817453456640262965071783657472, 7175878113405833249322534082293024008058894263817453456640262965071783657472
