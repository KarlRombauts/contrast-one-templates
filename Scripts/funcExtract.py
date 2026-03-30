import sys
from typing import List
import re



class FuncDef:
    def __init__(self, name: str, funcType: str) -> None:
        self.name = name
        self.type = funcType
        self.startLineNum = -1
        self.endLineNum = -1
        self.lines = []

funcs: List[FuncDef] = []

def isFuncDef(line: str):
    line = line.strip().upper()
    return line.strip().startswith("FUNCTION") or line.strip().startswith("PROCEDURE") # or line.strip().startswith("// ***") 


def processLines(lines: List[str]):
    funcStartLine = 0
    funcEndLine = 0
    blockStack = 0
    funcDef = None
    for (lineNum, line) in enumerate(lines):
        
        tokens = line.split()

        for (tokenIndex, token) in enumerate(tokens):
            token = token.strip().upper()

            if token in ["FUNCTION", "PROCEDURE"]:
                funcType = token

                nextToken = tokens[tokenIndex + 1]
                funcName = re.findall('\w+', nextToken)[0]
                print(funcName)
                funcDef = FuncDef(funcName, funcType)
                funcDef.startLineNum = lineNum
                blockStack = 0

            if token in ["BEGIN", "BEGIN;", "TRY", "CASE"]:
                blockStack += 1
            if token in ["END", "END;"]:
                blockStack -= 1
                if blockStack == 0:
                    funcDef.endLineNum = lineNum
                    funcEndLine = lineNum
                    # print(f"{funcDef.type}: {funcDef.name} - ln: {funcStartLine} - {funcEndLine}")
                    funcDef.lines = lines[funcDef.startLineNum:funcDef.endLineNum + 1]
                    funcs.append(funcDef)
        

def getFileLines(path):
    with open(path) as f:
        lines = f.readlines()
    return lines


def processFile(path):
    processLines(getFileLines(path))


if len(sys.argv) < 2:
    print("No input file specified")
    exit(2)

# if len(sys.argv) < 3:
#     print("No output file specified")
#     exit(3)

inputFilePath = sys.argv[1]
outputFilePath = sys.argv[2]



with open(outputFilePath, "w") as text_file:
    processFile(inputFilePath)
    for func in funcs:
        prefix = func.type.lower() + ": " + func.name 
        text_file.write(prefix)
        # text_file.write(" --- ")
        # text_file.write("".join(map(lambda x: x.strip().lower(), func.lines)))
        text_file.write("\n")


# with open(filePath, "w") as text_file:
#         text_file.writelines(func.lines)

# for func in funcs:
#     folder = func.type.lower() + "s"
#     fileName = func.name + ".pas"
#     filePath = folder + "/" + fileName

#     with open(filePath, "w") as text_file:
#         text_file.writelines(func.lines)