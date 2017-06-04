define(["../init/AppService"], function(services) {
  services.factory("ShareDataService", ShareDataService);

  function ShareDataService() {
    var addEditorTypes;
    var closeEditorIndex;
    var deleteEditorTab;
    var describeEditorType;
    var unsavedFilesList;
    var publishResult;

    var service = {
      getAddEditorTypes: getAddEditorTypes,
      getCloseEditorIndex: getCloseEditorIndex,
      getDeleteEditorTab: getDeleteEditorTab,
      getDescribeEditorType: getDescribeEditorType,
      getUnsavedFiles: getUnsavedFiles,
      getPublishResult: getPublishResult,

      setAddEditorTypes: setAddEditorTypes,
      setCloseEditorIndex: setCloseEditorIndex,
      setDeleteEditorTab: setDeleteEditorTab,
      setDescribeEditorType: setDescribeEditorType,
      setUnsavedFiles: setUnsavedFiles,
      setPublishResult: setPublishResult
    }

    return service;

    function getAddEditorTypes(){
      return addEditorTypes;
    }

    function getCloseEditorIndex() {
      return closeEditorIndex;
    }

    function getDeleteEditorTab() {
      return deleteEditorTab;
    }

    function getDescribeEditorType() {
      return describeEditorType
    }

    function getUnsavedFiles() {
      return unsavedFilesList;
    }

    function getPublishResult() {
      return publishResult;
    }

    function setAddEditorTypes(editorTypes) {
      addEditorTypes = editorTypes;
    }

    function setCloseEditorIndex(index) {
      closeEditorIndex = index;
    }

    function setDeleteEditorTab(editorTab) {
      deleteEditorTab = editorTab;
    }

    function setDescribeEditorType(editorType) {
      describeEditorType = editorType;
    }

    function setUnsavedFiles(unsavedFiles) {
      unsavedFilesList = unsavedFiles;
    }

    function setPublishResult(result) {
      publishResult = result;
    }
  }
});