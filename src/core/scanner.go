package core


var count int32
var code string


func Scanner(content string) []string {
	count = 0
	code = content
	var tokens []string
	for  {
		if int(count) >= len(content) {
			break
		}
		token := Next()
		
		if token != ""{
			tokens = append(tokens, token)
		}
	}
	return tokens
}


func Next() string {
	
	ch := code[count]
	chstr := string(code[count])
	if(isAlpha(rune((ch)))){
		var token []byte
		for isAlpha(rune(code[count])) || isNumber(rune(code[count])) {
			token = append(token, code[count])
			count ++
		}
		return string(token)
	}

	if(chstr == "("){
		count ++ // pass (
		count ++ // pass "
		return Next()
	}
	count++

	return ""
}

func isAlpha(target rune) bool {
	return target >= 'a' && target <= 'z' || target >= 'A' && target <= 'Z'
}

func isNumber(target rune) bool {
	return target >= '0' && target <= '9' 
}