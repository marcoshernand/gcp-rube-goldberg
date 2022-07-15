import os, subprocess

from flask import Flask, request, abort

app = Flask(__name__)


@app.route("/", methods=["POST"])
def main():
    #name = os.environ.get("NAME", "World")
    #return "Hello {}!".format(name)
    data = request.json
    o = subprocess.run(
        ["./gcve_script.sh"],
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
    )

    return {"results": o.stdout}

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))