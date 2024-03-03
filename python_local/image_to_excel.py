import sys
import win32com.client

excel_path = sys.argv[1]
foto_path = sys.argv[2]
coords = sys.argv[3]

excel = win32com.client.Dispatch("Excel.Application")
excel.Visible = True

wb = excel.Workbooks.Open(excel_path)
ws = wb.ActiveSheet

ws.Shapes.AddPicture(
    foto_path,
    False,
    True,
    ws.Range(coords).Left,
    ws.Range(coords).Top,
    ws.Range(coords).Width,
    ws.Range(coords).Height,
)