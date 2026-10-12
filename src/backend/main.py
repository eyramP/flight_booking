from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def hello():
    return {"message": "Flight booking API"}


def main():
    import uvicorn

    uvicorn.run("backend.main:app", host="0.0.0.0", port=8000)
