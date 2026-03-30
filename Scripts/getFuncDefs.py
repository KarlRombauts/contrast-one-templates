import sys

funcDefs = []

def isFuncDef(line: str):
    return line.strip().startswith("function") or line.strip().startswith("procedure") # or line.strip().startswith("// ***") 


def getFuncDefs(lines):
    return list(map(lambda x: x.strip(), (filter(isFuncDef, lines))))


def getFileLines(path):
    with open(path) as f:
        lines = f.readlines()
    return lines


def processFile(path):
    return "\n".join(getFuncDefs(getFileLines(path))) + "\n"


if len(sys.argv) < 2:
    print("No input file specified")
    exit(2)

if len(sys.argv) < 3:
    print("No output file specified")
    exit(3)

inputFilePath = sys.argv[1]
outputFilePath = sys.argv[2]


with open(outputFilePath, "w") as text_file:
    text_file.write(processFile(inputFilePath))
