int getFiles(){
  File folder = new File(path);
  File[] files = folder.listFiles();
  return files.length;
}
